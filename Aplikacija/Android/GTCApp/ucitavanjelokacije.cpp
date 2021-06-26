#include "ucitavanjelokacije.h"

UcitavanjeLokacije* UcitavanjeLokacije::instance = NULL;
bool UcitavanjeLokacije::liked = false;
bool UcitavanjeLokacije::loadLiked = false;
MLokacija* UcitavanjeLokacije::lokacija = NULL;
