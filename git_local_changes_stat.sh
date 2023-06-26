git add -A && git diff --cached --numstat | awk '{
	count+=1;
	plus+=$1;
	minus+=$2;

	} END {

  # Color Variables
	BLACKC="\033[30m";REDC="\033[31m";REDB="\033[41m";GREENB="\033[42m";YELLOWB="\033[43m";
	BLUEC="\033[34m";BLUEB="\033[44m";MAGENTB="\033[45m";NORMALB="\033[49m";NORMALC="\033[0m";

  # Range of change size
	rangeTo["XS"] = 10;
	rangeTo["S"] = 50;
	rangeTo["M"] = 100;
	rangeTo["L"] = 250;

  printf ">>> Git Local Changes Stat\n";

  if (plus <= 0 && minus <= 0) {
    printf "›>> Any no changes \n";
    exit 0;
  }

  sum = plus + minus;
  size = "XS";
  color = GREENB;

  if ( sum < rangeTo["XS"] ) {
    size = "XS"
    color = GREENB;
  } else if ( sum < rangeTo["S"] ) {
    size = "S";
    color = BLUEB;
  } else if( sum < rangeTo["M"] ) {
    size = "M";
    color = YELLOWB;
  } else if( sum < rangeTo["L"] ) {
    size = "L";
    color = MAGENTB;
  } else {
    size = "XL";
    color = REDB;
  }

  printf ">>> " count " files," REDC plus " insertions(+), " BLUEC minus " deletions(-)" NORMALB NORMALC "\n";
  printf ">>> " color BLACKC " Your commit size is " size ". " NORMALB NORMALC "\n";

}'
