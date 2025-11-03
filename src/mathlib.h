
#pragma once


#ifdef __cplusplus
extern "C" {
#endif

#ifdef BUILD_DLL
#define API __declspec(dllexport)
#else
#define API __declspec(dllimport)
#endif

API int add(int a, int b);
API int sub(int a, int b);

#ifdef __cplusplus
}
#endif
