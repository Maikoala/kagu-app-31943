document.addEventListener('DOMContentLoaded', function(){
  if (document.getElementById('item_image')){
    const ImagePreview = document.getElementById('image-preview');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobimage = document.createElement('img');
      blobimage.setAttribute('src', blob);

      imageElement.appendChild(blobimage);
      ImagePreview.appendChild(imageElement);
    };

    document.getElementById('item_image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
    });
  };
});