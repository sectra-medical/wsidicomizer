import os

import pytest

from .convert_test_functions import ConvertTest


@pytest.mark.convert_philips
class PhilipsConvertTest(ConvertTest):
    test_data_dir = os.environ.get(
            "PHILIPS_TESTDIR",
            "C:/temp/opentile/philips_tiff/"
        )
    input_filename = 'input.tif'
    include_levels = [4, 6]
    turbo_path = os.environ['TURBOJPEG']
    tile_size = None

    def __init__(self, *args, **kwargs):
        super(ConvertTest, self).__init__(*args, **kwargs)
