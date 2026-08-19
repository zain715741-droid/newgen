import 'package:cloudinary/cloudinary.dart';

class CloundinaryServices {


final cloudinary = Cloudinary.signedConfig(
  apiKey: "487575445124471",
  apiSecret: "DQ-nXLBP8egHR36Mni-C7wPkxqg",
  cloudName: "fmct9dtr", 
); 



uploadImage(String filePath) async {
  try {
    final response = await cloudinary.upload(
     file: filePath,
      resourceType: CloudinaryResourceType.image,
    );
    return print(response.secureUrl);
  
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}




}