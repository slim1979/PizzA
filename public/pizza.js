//
// function something ()
// {
//
// 	var x= window.localStorage.getItem('aaa') // сейчас х имеет тип string
//
// 	x = x*1 + 1 //умножаем х на 1 для того, чтобы сменить тип переменной со string на int
//
// 	window.localStorage.setItem('aaa',x)
//
// 	alert(x);
//
// }

function something ()
{

	var x= window.localStorage.getItem('bbb') // сменили aaa на bbb чтобы обнулить значение х

	x = x*1 + 1 //умножаем х на 1 для того, чтобы сменить тип переменной со string на int

	window.localStorage.setItem('bbb',x)

	alert(x);

}
