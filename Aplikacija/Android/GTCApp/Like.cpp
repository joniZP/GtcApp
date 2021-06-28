#include "Like.h"

bool Like::liked = false;
bool Like::loadLiked = false;
QTimer* Like::liketimer = NULL;
Tip Like::tip = Tip::LokacijaTip;
int Like::id = 0;
Like* Like::instance = NULL;
