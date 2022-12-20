<?php

namespace App\Traits;

trait RepoResponse {

    public function formatResponse(bool $status, string $msg, string $redirect_to, $data = null, string $flash_type = '') : object
    {

        if ($flash_type == '') {
            $flash_type = $status ? 'flashMessageSuccess' : 'flashMessageError'; // flashMessageWarning
        }

        return (object) array(
            'status'         => $status,
            'msg_title'      => $status ? 'Success' : 'Error',
            'msg'            => $msg,
            'description'    => $msg,
            'data'           => $data,
            'id'             => ! is_array($data) && $data != '' ? $data : 0,
            'redirect_to'    => $redirect_to,
            'redirect_class' => $flash_type
        );
    }

    public function urlSlug($text){
        $text = strtolower($text);
        // return str_replace(" ", "-", preg_replace('/([%\$!-_;:,.#\'"@*]+)/','', $url_string));

        // replace non letter or digits by -
        $text = preg_replace('~[^\pL\d]+~u', '-', $text);

        // transliterate
        $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

        // remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);

        // trim
        $text = trim($text, '-');

        // remove duplicated - symbols
        $text = preg_replace('~-+~', '-', $text);

        // lowercase
        // $text = strtolower($text);

        if (empty($text)) {
          return 'n-a';
        }

        return $text;
    }

    public function dateDiffInDays($date1, $date2)
    {
        // Calculating the difference in timestamps
        $diff = strtotime($date2) - strtotime($date1);

        // 1 day = 24 hours
        // 24 * 60 * 60 = 86400 seconds
        return abs(round($diff / 86400));
    }
}
