#pragma once

typedef struct sample {
    int x;
} sample;

// TODO: Replace sample code
[[maybe_unused]] void sample_set_x (sample *sample, int new_value);
[[maybe_unused]] int  sample_get_x (const sample *sample);
