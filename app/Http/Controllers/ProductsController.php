<?php

namespace App\Http\Controllers;

use League\Csv\Reader;
use App\Models\Product;
use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Http\Request;
use App\Http\Requests\Product\StoreRequest;
use App\Http\Requests\Product\UpdateRequest;
use App\Http\Services\ProductsService;
use App\Http\Services\Products\ProductOptionsService;

class ProductsController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;
    private $productsService;

    public function __construct()
    {

        $this->productsService = new ProductsService();
    }

    public function getById()
    {

        $products = $this->productsService->getById(id: request('id'));
        return $this->apiResponse($products);
    }
    public function get()
    {

        $products = $this->productsService->get(categoryId: request('category_id'));
        return $this->apiResponse($products);
    }

    public function create(StoreRequest $request)
    {

        $data = $request->validated();

        $createdProduct = $this->productsService->create($data);
        return $this->apiResponse($createdProduct);
    }

    public function uploadImages(Request $request)
    {

        // Validate the incoming request to ensure files are provided
        // $request->validate([
        //     'images' => 'required|array',
        //     'images.*' => 'required|file|image', // Validate that each entry is a file and an image
        // ]);
        $file = $request->file('image'); // Get the uploaded files


        // Extract and trim the product name by removing the file extension
        // $productName = trim(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME));

        // Search for the product by name
        $product = Product::where('id', request('id'))->first();

        if ($product) {
            // // Define the path where the images will be stored
            // $imagePath = 'images/' . $file->getClientOriginalName();

            // // Store the image in the 'public/images' directory
            // $file->storeAs('public/images', $file->getClientOriginalName());

            // Save the image path to the product
            $product->img_path = $file;
            $product->save();
        }
  

        return response()->json(['message' => 'Images processed successfully.'], 200);
    }

    public function update(UpdateRequest $request)
    {

        $product = $request->validated();
        $updatedProduct = $this->productsService->update($product);
        return $this->apiResponse($updatedProduct);
    }

    public function toggleActivation($id, $activationStatus)
    {

        $this->productsService->toggleActivation($id, $activationStatus);
        return $this->apiResponse();
    }

    public function delete($id)
    {

        $this->productsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }
}
