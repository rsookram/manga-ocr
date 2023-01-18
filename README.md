# Manga OCR

Optical character recognition for Japanese text, with the main focus being Japanese manga.
It uses a custom end-to-end model built with Transformers' [Vision Encoder Decoder](https://huggingface.co/docs/transformers/model_doc/vision-encoder-decoder) framework. 

Manga OCR can be used for OCR of manga-like content. Its main goal was to provide a high quality
text recognition, robust against various scenarios specific to manga:
- both vertical and horizontal text
- text with furigana
- text overlaid on images
- wide variety of fonts and font styles
- low quality images

Unlike many OCR models, Manga OCR supports recognizing multi-line text in a single forward pass,
so that text bubbles found in manga can be processed at once, without splitting them into lines.

See also:
- Development code, including code for training and synthetic data generation: [link](manga_ocr_dev)
- Description of synthetic data generation pipeline + examples of generated images: [link](manga_ocr_dev/synthetic_data_generator)

## Build

```shell
docker build -t manga-ocr .
```

## Usage

The model will be downloaded if not provided. It's ~400 MB, so it's a good idea
to [download the files from here](https://huggingface.co/kha-white/manga-ocr-base/tree/main)
and mount them into the container to prevent them from being downloaded on each
run.

```shell
docker run -t --rm --mount type=bind,source=model/,target=/app/manga-ocr-base manga-ocr --pretrained_model_name_or_path manga-ocr-base --read-from assets/examples
```

## Usage tips

- OCR supports multi-line text, but the longer the text, the more likely some errors are to occur.
  If the recognition failed for some part of a longer text, you might try to run it on a smaller portion of the image.

## Acknowledgments

This project was done with the usage of:
- [Manga109-s](http://www.manga109.org/en/download_s.html) dataset
- [CC-100](https://data.statmt.org/cc-100/) dataset
