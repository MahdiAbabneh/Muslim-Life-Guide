class PageInfo {
  final int startPage;
  final int lastPage;
  final int totalProgress;

  PageInfo(this.startPage, this.lastPage)
      : totalProgress = lastPage - startPage+1;
}

PageInfo getPageInfo(int caseNumber) {
  int startPage=0;
  int lastPage=0;

  switch (caseNumber) {
    case 0:
      startPage = 1;
      lastPage = 21;
      break;
    case 1:
      startPage = 22;
      lastPage = 41;
      break;
    case 2:
      startPage = 42;
      lastPage = 61;
      break;
    case 3:
      startPage = 62;
      lastPage = 81;
      break;
    case 4:
      startPage = 82;
      lastPage = 101;
      break;
    case 5:
      startPage = 102;
      lastPage = 121;
      break;
    case 6:
      startPage = 122;
      lastPage = 141;
      break;
    case 7:
      startPage = 142;
      lastPage = 161;
      break;
    case 8:
      startPage = 162;
      lastPage = 181;
      break;
    case 9:
      startPage = 182;
      lastPage = 201;
      break;
    case 10:
      startPage = 202;
      lastPage = 221;
      break;
    case 11:
      startPage = 222;
      lastPage = 241;
      break;
    case 12:
      startPage = 242;
      lastPage = 261;
      break;
    case 13:
      startPage = 262;
      lastPage = 281;
      break;
    case 14:
      startPage = 282;
      lastPage = 301;
      break;
    case 15:
      startPage = 302;
      lastPage = 321;
      break;
    case 16:
      startPage = 322;
      lastPage = 341;
      break;
    case 17:
      startPage = 342;
      lastPage = 361;
      break;
    case 18:
      startPage = 362;
      lastPage = 381;
      break;
    case 19:
      startPage = 382;
      lastPage = 401;
      break;
    case 20:
      startPage = 402;
      lastPage = 421;
      break;
    case 21:
      startPage = 422;
      lastPage = 441;
      break;
    case 22:
      startPage = 442;
      lastPage = 461;
      break;
    case 23:
      startPage = 462;
      lastPage = 481;
      break;
    case 24:
      startPage = 482;
      lastPage = 501;
      break;
    case 25:
      startPage = 502;
      lastPage = 521;
      break;
    case 26:
      startPage = 522;
      lastPage = 541;
      break;
    case 27:
      startPage = 542;
      lastPage = 561;
      break;
    case 28:
      startPage = 562;
      lastPage = 581;
      break;
    case 29:
      startPage = 582;
      lastPage = 604;
      break;
    default:
  }

  PageInfo pageInfo = PageInfo(startPage, lastPage);
  return pageInfo;
}
