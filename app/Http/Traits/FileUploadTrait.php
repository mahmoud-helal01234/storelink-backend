<?php

namespace App\Http\Traits;

use Illuminate\Support\Facades\File;

trait FileUploadTrait
{
    protected function uploadFile($file, $location, $imagePath = null)
    {

        if ($imagePath) {
            $img = public_path($imagePath);
            File::delete($img);
        }

        $file_original_name = $file->getClientOriginalName();
        $file_original_extension = $file->getClientOriginalExtension();
        $file_unique_name = time() . rand(100, 999) . '.' . $file_original_extension;
        $new_path = $location;
        $folder_path = public_path($new_path);

        // Compress images, otherwise upload normally
        if (in_array($file_original_extension, ['jpg', 'jpeg', 'png', 'webp'])) {

            $manager = new \Intervention\Image\ImageManager(
                new \Intervention\Image\Drivers\Gd\Driver()
            );

            $image = $manager->read($file);

             $image->scaleDown(
                width: 512,
                height: 512
            );

            $path = $folder_path . DIRECTORY_SEPARATOR . $file_unique_name;

            match ($file_original_extension) {
                'jpg', 'jpeg' => $image->toJpeg(70)->save($path),
                'png'         => $image->toPng()->save($path),
                'webp'        => $image->toWebp(70)->save($path),
            };
        } else {
            $file->move($folder_path, $file_unique_name);
        }
        return $new_path . '/' . $file_unique_name;
    }

    public function deleteFile($filePath)
    {
        if ($filePath) {
            $img = public_path($filePath);
            File::delete($img);
        }
    }
}
