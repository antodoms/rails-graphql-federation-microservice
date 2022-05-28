var superQuery = `{
  allPersons {
    nodes {
      id
      name
      dateOfBirth
      phoneNumber
      events {
        message
      }
    }
  }
}`;
var personsData;
var selectedIndex = 0;

function fetchData() {
  $.ajax({
    method: "POST",
    url: "/graphql",
    contentType: "application/json",
    data: JSON.stringify({
      query: superQuery
    })
  }).done(function( data ) {
    if ( data.data.allPersons.nodes ) {
      personsData = data.data.allPersons.nodes;
      addPersons();
      showEvents(selectedIndex);
    }
  });
}

function addPersons() {
  var tableBody = $("#allPersons");

  $.each( personsData, function( key, person ) {
    tableRow = '<tr class="tableRefresh"><th>' + person.id + '</th>';
    tableRow += '<th>' + person.name + '</th>';
    tableRow += '<th>' + person.dateOfBirth + '</th>';
    tableRow += '<th>' + person.phoneNumber + '</th>';
    tableRow += '<th onclick=showEvents('+ key + ')>watch</th></tr>';
    tableBody.append(tableRow);
  });
}

function showEvents(key) {
  var divBody = $("#showPersonEvents");

  divBody.html('');
  $.each( personsData, function( index, person ) {
    if (index == key) {
      $.each( person.events, function( event_index, event ) {
        content = '<p>' + event.message + '</p>';
        divBody.append(content);
      });
    }
  });

  // update current selected index for future websocket
  selectedIndex = key;
}

fetchData();
