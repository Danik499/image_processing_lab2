img = imread('./Boat.png');

[minimum, maximum, mean, standart_deviation, variance, snr] = image_statistical_analysis(img);

image_with_noise = additive_gaussian_noise(img, 0.3);

imwrite(image_with_noise, "./noised_img.png");

noised_img = imread("./noised_img.png");
kernel = 1/16 * [1 2 1; 2 4 2; 1 2 1];
filtered_img = filtering(noised_img, kernel);

imwrite(filtered_img, "./filtered.png");

psnr_between_noised_and_clean_image = peaksnr(img, noised_img);
rmse_between_noised_and_clean_image = rmse(img, noised_img);

psnr_between_filtered_and_clean_image = peaksnr(img, filtered_img);
rmse_between_filtered_and_clean_image = rmse(img, filtered_img);