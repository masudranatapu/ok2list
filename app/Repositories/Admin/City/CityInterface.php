<?php

namespace App\Repositories\Admin\City;

interface CityInterface
{
    public function getPaginatedList($request, int $per_page = 5);
    public function postStore($request);
    public function postUpdate($request, int $id);
    public function findOrThrowException($id);
    public function delete(int $PK_NO);
}
