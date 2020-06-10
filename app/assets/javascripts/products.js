$function(){
  $(document).on('turbolinks:load'{
  // 画像用のinputを生成する関数
  const buildFileField(index){
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5];

  $('#image-file').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-file').append(buildFileField(index));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
  });

  
});