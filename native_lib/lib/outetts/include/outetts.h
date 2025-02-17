#ifndef OUTETTS_H
#define OUTETTS_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef WIN32
#define OUTETTS_EXPORT __declspec(dllexport)
#else
#define OUTETTS_EXPORT __attribute__((visibility("default"))) __attribute__((used))
#endif

    typedef struct {
        const int n_threads;
        const char* text;
        const char* output_path;
        const char* model_vocoder_path;
        const char* model_path;
    } outetts_options_t;

    // OUTETTS_EXPORT int outetts_load_model_vocoder(const char* model_vocoder_path);
    // OUTETTS_EXPORT int outetts_load_model_vocoder_free(void);

    // OUTETTS_EXPORT int outetts_load_model(const char* model_path);
    // OUTETTS_EXPORT int outetts_load_model_free(void);

    // OUTETTS_EXPORT int outetts_ensureInitialized(outetts_options_t options);

    OUTETTS_EXPORT int outetts_inference(outetts_options_t options);

#ifdef __cplusplus
}
#endif

#endif // OUTETTS_H