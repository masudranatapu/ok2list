<?php

namespace App\Repositories\Admin\SubCategory;

interface SubCategoryInterface
{
    public function getPaginatedList($request, int $per_page, $cat_id);
    public function postStore($request);
    public function postUpdate($request, int $id);
    public function findOrThrowException($id);
    public function delete($id);
}
