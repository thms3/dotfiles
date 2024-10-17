#!/usr/bin/env bash

pdf2ps $1 tmp.ps

ps2pdf tmp.ps $2

rm tmp.ps
