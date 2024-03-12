let button1 = document.getElementById("button1")
let button2 = document.getElementById("button2")
let button3 = document.getElementById("button3")
let button_list = [button1, button2, button3]
let current_button = null;

function switchLayout(index) {
  if (current_button === null) {
    current_button = button_list[index]
  }
  else {
    current_button.style.backgroundColor = "white";
    current_button = button_list[index];
  }
  current_button.style.backgroundColor = "#E0E0E0";
}

button1.onmousedown = switch_layout(button_list.indexOf(button1));
button2.onmousedown = switch_layout(button_list.indexOf(button2));
button3.onmousedown = switch_layout(button_list.indexOf(button3));