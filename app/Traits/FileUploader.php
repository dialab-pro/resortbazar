<?php

namespace App\Traits;

use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

trait FileUploader
{
    /*
     |--------------------------------------------------------------------------
     | UPLOAD IMAGE
     |--------------------------------------------------------------------------
    */
    public function uploadImage($uploadImage,$moduleName, $model, $database_field_name, $basePath, $width, $height)
    {
        if ($uploadImage) {
            try {

                $basePath = 'uploads/'. $moduleName .'/' . $basePath . '/' . date('Y') . '/' . date('m');
                $image_name = $model->id . time() . '-' . rand(11111, 999999) . '.' . 'webp';


                if (file_exists($model->$database_field_name) && $model->$database_field_name != '') {
                    unlink($model->$database_field_name);
                }

                if (!is_dir($basePath)) {
                    \File::makeDirectory($basePath, 493, true);
                }

                Image::make($uploadImage->getRealPath())
                    ->encode('webp', 90)
                    ->fit($width, $height)
                    // ->resize($width, $height, function ($constraint) {
                    //     $constraint->aspectRatio();
                    //     $constraint->upsize();
                    // })
                    ->save($basePath . '/' . $image_name);

                $model->update([$database_field_name => ($basePath . '/' . $image_name)]);

            } catch (\Exception $ex) {}
        }
    }


    // upload image multi
    public function uploadImages($uploadImages, $moduleName, $model, $database_field_name, $basePath, $width, $height)
{
    // Check if images are uploaded
    if ($uploadImages && is_array($uploadImages)) {
        try {
            $uploadedPaths = [];

            // Define the base path for storing images
            $basePath = 'uploads/' . $moduleName . '/' . $basePath . '/' . date('Y') . '/' . date('m');

            // Delete old images if exist and database field is not empty
            if ($model->$database_field_name && $model->$database_field_name != '') {
                $oldImages = json_decode($model->$database_field_name, true);
                foreach ($oldImages as $oldImage) {
                    if (file_exists($oldImage)) {
                        unlink($oldImage);
                    }
                }
            }

            // Create directory if it does not exist
            if (!is_dir($basePath)) {
                \File::makeDirectory($basePath, 493, true);
            }

            // Loop through each uploaded image
            foreach ($uploadImages as $uploadImage) {
                // Generate a unique image name
                $image_name = $model->id . time() . '-' . rand(11111, 999999) . '.' . 'webp';

                // Process and save the image
                Image::make($uploadImage->getRealPath())
                    ->encode('webp', 90)
                    ->fit($width, $height)
                    // ->resize($width, $height, function ($constraint) {
                    //     $constraint->aspectRatio();
                    //     $constraint->upsize();
                    // })
                    ->save($basePath . '/' . $image_name);

                // Store the image path
                $uploadedPaths[] = $basePath . '/' . $image_name;
            }

            // Update the model with the new images' paths encoded as JSON
            $model->update([$database_field_name => json_encode($uploadedPaths)]);

        } catch (\Exception $ex) {
            // Handle exceptions if necessary
        }
    }
}


}
