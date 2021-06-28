#include "UcitavanjeDogadjaja.h"

static MDogadjaj* dogadjaj;
static UcitavanjeDogadjaja * instance;
static int brslika;


MDogadjaj* UcitavanjeDogadjaja::dogadjaj = NULL;
UcitavanjeDogadjaja* UcitavanjeDogadjaja::instance = NULL;
int UcitavanjeDogadjaja::brslika = 0;
