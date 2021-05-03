document.addEventListener('DOMContentLoaded', function(){
  if (document.getElementById('item_image')){
    const ImagePreview = document.getElementById('image-preview');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobimage = document.createElement('img');
      blobimage.setAttribute('src', blob);
      blobimage.setAttribute('class', 'form-image-preview');

      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`);
      inputHTML.setAttribute('name', 'item[images][]');
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobimage);
      imageElement.appendChild(inputHTML)
      ImagePreview.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      });
    };

    document.getElementById('item_image').addEventListener('change', function(e){
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
    });
  };
});