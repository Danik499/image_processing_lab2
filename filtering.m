function filtered_image = filtering(img, kernel)
  flipped_kernel = flip(fliplr(kernel));
  kernel_size = size(kernel)(1);
  
  extended_image = mirror_image(img, kernel_size);
  
  columns = size(img)(1);
  rows = size(img)(2);
  
  filtered_image = [];
  
  for i=2:rows+1
    for j=2:columns+1
      m = extended_image(i-1:i+1, j-1:j+1);
      pixel = sum(sum(flipped_kernel .* m));
      
      filtered_image(end+1) = pixel;
    endfor
  endfor
  
  filtered_image = uint8(reshape(filtered_image, columns, rows)');
endfunction
