<?php
   $old_photos = $row->allPhotos ?? null ;
?>
<div class="row form-group add-image">
   <label class="col-sm-3 label-title">Photos</label>
   <div class="col-sm-9">
      <div class="row">
         @if($old_photos != null )
            @foreach($old_photos as $oldphotos)
               <div class="col-md-3 col-sm-4 col-6 img_div_{{$oldphotos->pk_no ?? ''}}">
                  @if(isset($oldphotos))
                     <img src="{{$oldphotos->img_path_thumb}}" alt="Article Photo" class="img-fluid" height="100px" width="120px"/>
                     <a href="#" class="btn fileupload-exists btn-default btn-rounded  btn-sm photo-delete" data-dismiss="fileupload" data-id="{{$oldphotos->pk_no ?? ''}}">
                        <i class="fa fa-times"></i>
                        Remove
                     </a>
                  @endif
               </div>
            @endforeach
         @endif
      </div>
   </div>
</div>
