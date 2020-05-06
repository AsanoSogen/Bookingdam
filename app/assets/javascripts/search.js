$(function() {
  let search_list = $(".contents_row");
  
  function appendUser(user) {
    let html = `<div class = "user_biglist">
                  <div class = "user_list">
                    <a href= "/users/${user.id}">
                      <p>ユーザー名:${user.nickname}</p>
                    </a>
                  </div>
                </div>`;

    search_list.append(html);
  }
  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`;
    search_list.append(html);
  }

  $(function () {
    $(".search-input").on("keyup", function(){
      let input = $(".search-input").val();
      $.ajax({
        type: 'GET',
        url: '/users/search',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(users) {
        console.log(users);
        $(".contents_row").empty();
        if (users.length !== 0) {
          users.forEach(function(user){
            appendUser(user);
          });
        }
        else {
          appendErrMsgToHTML("お探しの主催者はいません");
        }
      })
      .fail(function() {
        alert('通信エラーです。ユーザーが表示できません。');
      });
    });
  });
});