$key = "private.pem"
.\nrfutil keys generate $key
.\nrfutil keys display --key pk --format code $key --out_file public_key.c