# CPE222
---

## Installation

```console
 pip install -r requirements.txt 
```

> I recommend using python virtual environment for install all library.
You can read more about virtual environment at
[Virtual Environment](https://docs.python.org/3/library/venv.html).

Then install APIO tools.

```console
 apio install --all
```

## Build

```console
 apio init --board upduino31
 apio build
```

## Upload

### Driver
 To select driver, you should run command promt, terminal, or shell as administrator.
```console
 apio drivers --ftdi-enable
```
 For MacOS, you must install homebrew before install apio, and do not forget to add PATH in your environment variable.

### Testing
```console
 apio system --lsftdi
```
 If it found 1 driver connected, it finished. 

### Upload Code
```console
 apio upload
```