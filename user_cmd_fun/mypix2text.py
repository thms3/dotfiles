import argparse
from pix2text import Pix2Text, merge_line_texts
import sys

def process_image(img_fp, output_type, resized_shape):
    p2t = Pix2Text()
    outs = p2t(img_fp, resized_shape=resized_shape)

    if output_type == 'all':
        print(outs,"\n")
        only_text = merge_line_texts(outs, auto_line_break=True)
        print(only_text)
    elif output_type == 'formula':
        print(outs[0]["text"])
    elif output_type == 'text':
        only_text = merge_line_texts(outs, auto_line_break=True)
        print(only_text)
    else:
        print("Invalid output_type. Choose from 'all', 'formula', or 'text'.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process an image using pix2text.")
    parser.add_argument("image_filepath", help="Path to the input image.")
    parser.add_argument("output_type", choices=['all', 'formula', 'text'], default='formula', help="Type of output to display.")
    parser.add_argument("--resized_shape", type=int, default=608, help="Resized shape value. Default is 608.")

    args = parser.parse_args()
    img_fp = args.image_filepath
    output_type = args.output_type
    resized_shape = args.resized_shape

    process_image(img_fp, output_type, resized_shape)
