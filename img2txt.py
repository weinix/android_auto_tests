#!/usr/bin/env python3
import sys
import cv2
import pytesseract

imgfile = sys.argv[1]
pytesseract.pytesseract.tesseract_cmd = r'/usr/bin/tesseract'
img=cv2.imread(imgfile)
text = pytesseract.image_to_string(img)
print(text)
