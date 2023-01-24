<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Language;
use Brian2694\Toastr\Facades\Toastr;
// use Facade\FlareClient\Stacktrace\File;
use Illuminate\Support\Str;
use Stichoza\GoogleTranslate\GoogleTranslate;

class LanguagesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $languages = Language::get();
        return view('admin.languages.index', compact('languages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $path = base_path('Resources/lang/languages.json');
        $translations = json_decode(file_get_contents($path), true);

        return view('admin.languages.create', compact('translations'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $request->validate(
            [
                'name' => "required|unique:languages,name",
                'code' => "required|unique:languages,code",
                'icon' => "required|unique:languages,icon",
                'direction' => "required"
            ],
            [
                'name.required' => 'You must select a language',
                'code.required' => 'You must select a language code',
                'icon.required' => 'You must select a flag',
                'direction.required' => 'You must select a direction',
                'name.unique' => 'This language already exists',
                'code.unique' => 'This code already exists',
                'icon.unique' => 'This flag already exists',
            ],
        );

        $language = Language::create([
            'name' => $request->name,
            'code' => $request->code,
            'icon' => $request->icon,
            'direction' => $request->direction,
        ]);

        if ($language) {

            $baseFile = base_path('resources/lang/en.json');
            $fileName = base_path('resources/lang/' . Str::slug($request->code) . '.json');
            copy($baseFile, $fileName);

            Toastr::success('Language successfully create :-)','Success');
            return redirect()->route('languages.index');

        } else {

            Toastr::error('Someting went worng. Please try again :-)','Success');
            return redirect()->back();

        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $languages = Language::findOrFail($id);

        $path = base_path('Resources/lang/languages.json');
        $translations = json_decode(file_get_contents($path), true);

        return view('admin.languages.edit', compact('languages', 'translations'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $languages = Language::findOrFail($id);

        $request->validate(
            [
                'name' => "required|unique:languages,name,{$languages->id}",
                'code' => "required|unique:languages,code,{$languages->id}",
                'icon' => "required|unique:languages,icon,{$languages->id}",
                'direction' => "required"
            ],
            [
                'name.required' => 'You must select a language',
                'code.required' => 'You must select a code',
                'icon.required' => 'You must select a flag',
                'direction.required' => 'You must select a direction',
                'name.unique' => 'This language already exists',
                'code.unique' => 'This code already exists',
                'icon.unique' => 'This flag already exists',
            ],
        );

        // rename file
        $oldFile = $languages->code . '.json';
        $oldName = base_path('resources/lang/' . $oldFile);
        $newFile = Str::slug($request->code) . '.json';
        $newName = base_path('resources/lang/' . $newFile);

        rename($oldName, $newName);

        // update
        $updated = $languages->update([
            'name' => $request->name,
            'code' => $request->code,
            'icon' => $request->icon,
            'direction' => $request->direction
        ]);

        $updated ? Toastr::info('Language successfully update :-)','Success') : Toastr::error('Something went worng. Please try again :-)','Success');
        return redirect()->route('languages.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $languages = Language::findOrFail($id);

        if ($languages->default_lang == 1) {
            Toastr::info('You can not delete default language :-)','Success');
            return redirect()->back();
        }

        if (file_exists(base_path('resources/lang/' . $languages->code . '.json'))) {
            unlink(base_path('resources/lang/' . $languages->code . '.json'));
        }

        $languages->delete();

        Toastr::info('Language successfully delete :-)','Success');
        return redirect()->back();

    }

    public function setDefaultLanguage(Request $request)
    {

        Language::where('default_lang', 1)->update([
            'default_lang' => 0,
        ]);

        Language::where('code', $request->code)->update([
            'default_lang' => 1,
        ]);


        if (session()->get('set_lang') != $request->code) {
            session()->put('set_lang', $request->code ?? 'en');
            app()->setLocale($request->code);
        }

        Toastr::success('Defualt language set successfully done :-)','Success');
        return redirect()->back();

    }

    public function languageSetting($code)
    {

        $path = base_path('resources/lang/' . $code . '.json');
        $languages = Language::where('code', $code)->first();
        $translations = json_decode(file_get_contents($path), true);

        return view('admin.languages.view', compact('languages', 'translations'));

    }

    // translate language
    public function transUpdate(Request $request)
    {
        $language = Language::findOrFail($request->lang_id);
        $data = file_get_contents(base_path('resources/lang/en.json'));

        $translations = json_decode($data, true);

        foreach ($translations as $key => $value) {
            if ($request->$key) {
                $translations[$key] = $request->$key;
            } else {
                $translations[$key] = $value ?? '';
            }
        }

        $updated = file_put_contents(base_path('resources/lang/' . $language->code . '.json'), json_encode($translations, JSON_UNESCAPED_UNICODE));

        $updated ? Toastr::success('Translations updated successfully:-)','Success') : Toastr::success('Something is worng. Please try again :-)','Success');

        return redirect()->back();

    }

    public function autoTransSingle(Request $request)
    {
        $text = autoTransLation($request->lang, $request->text);
        return response()->json($text);
    }

    public function transUpdateAutoAll(Request $request)
    {

        $language = Language::findOrFail($request->lang);
        $data = file_get_contents(base_path('resources/lang/' . $language->code . '.json'));
        $translations = json_decode($data, true);

        $afterTrans = [];
        $tr = new GoogleTranslate($language->code);
        foreach ($translations as $key => $value) {

            $autoTransValue = $tr->translate($value);
            $afterTrans[$key] = $autoTransValue;
        }

        return response()->json(['data' => $afterTrans]);
    }


}
