#!/bin/bash

echo "========================================"
echo "Install python requirements"
echo "----------------------------------------"
pyenv install -f 3.6.3
pyenv global 3.6.3
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
python3 -m pip install -r requirements.txt

echo "----------------------------------------"
echo
echo "========================================"
echo "Build VTR"
echo "----------------------------------------"
export FAILURE=0
make -k CMAKE_PARAMS="-DVTR_ASSERT_LEVEL=3" -j$MAX_CORES || export FAILURE=1

echo
echo
echo
echo

# When the build fails, produce the failure output in a clear way
if [ $FAILURE -ne 0 ]; then
        make CMAKE_PARAMS="-DVTR_ASSERT_LEVEL=3" -j1
        exit 1
fi
