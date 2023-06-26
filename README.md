# git stat

![git stat sample](https://baek.dev/assets/images/post/2023/2023_051_000.gif)  

`git stat` 명령어로 local changes(stage)의 변경 크기 즉시 확인 할 수 있습니다.   

## Background  

> 커밋 크기란,  
> 추가된 라인 수와 삭제된 라인 수의 합계를 의미합니다.

커밋이 크면, 변화가 크다는 내용이고, 즉 리뷰할 때 많은 내용을 봐야한다는 것을 의미합니다..  
리뷰를 요청하기 전 커밋 사이즈를 미리 알 수 있다면, 작업 분량을 적절히 분리하는데 도움이 될 것입니다.

물론 커밋 크기, 즉 코드 변경 크기는 주로 원격 저장소에 Merge를 시도할 때 확인되지만, 이는 사후적인 행동에 불과합니다. 이보다는 사전에 이를 확인하고 조치하는 것이 효율적입니다.  

자세한 내용은 [git stat를 이용하여 코드 리뷰 요청 전 커밋 사이즈 관리하기](https://baek.dev/post/51/) 글을 통해 확인 할 수 있습니다.      




## Run  

1. git_local_changes_stat.sh 파일을 다운 받거나 이 레포지토리를 clone 합니다. 

```shell
# clone  
$> git clone https://github.com/baekdev/git-stat.git  
```  

2. 파일 권한 부여 

```shell
# clone 혹은 download 경로에 맞게 수정   
$> chmod 755 ~/projects/git-stat/git_local_changes_stat.sh    
```  

3. git alias 추가  
```shell
# clone 혹은 download 경로에 맞게 수정  
$> git config --global alias.stat '!sh ~/projects/git-stat/git_local_changes_stat.sh'  
```  

4. git project에서 테스트  
```shell
$ project/sample> git stat
```  


---  

기타 버그 및 오류 제보: [issue](https://github.com/baekdev/git-stat/issues)

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fbaekdev%2Fgit-stat&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)


