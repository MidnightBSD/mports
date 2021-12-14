const eventDisplayAreaEl = document.querySelector("#events-display");
const eventDisplaySelectEl = document.querySelector("#run-selector");
const statusMessageEl = document.createElement("h2");

// Initialize our widget's state object
const state = {
  isLoading: false,
  hasError: false,
};

// Setup a proxy to trigger custom events on state object manipulation
const stateProxy = new Proxy(state, {
  set: function (target, key, active) {
    if (key === "isLoading") {
      statusMessageEl.textContent = "Loading...";
      if (active) {
        console.log(key, active);
        eventDisplayAreaEl.appendChild(statusMessageEl);
      } else {
        console.log(key, active);
        eventDisplayAreaEl.removeChild(statusMessageEl);
      }
    }

    if (key === "hasError") {
      statusMessageEl.textContent = "Error!";
      if (active) {
        console.log(key, active);
        eventDisplayAreaEl.appendChild(statusMessageEl);
      } else {
        console.log(key, active);
        eventDisplayAreaEl.removeChild(statusMessageEl);
      }
    }
    console.log(`${key} set from ${stateProxy[key]} to ${active}`);
    target[key] = active;
    return true;
  },
});

/**
 * Parse an array of objects and convert it to HTML
 * @param {array} data - JSON object
 * @returns {void}
 */
async function serializeEvents(data) {
  const eventTableEl = document.createElement("table");
  const eventTableHeaderEl = document.createElement("thead");
  const eventTableBodyEl = document.createElement("tbody");
  const fetchedData = await data;
  const fetchedEvents = fetchedData.events;

  // Establish list of table headings (i.e. columns)
  const eventTableHeaderTitles = Object.keys(fetchedEvents[0]);

  // Generate the table head with our titles
  eventTableHeaderTitles.forEach((headTitle) => {
    const th = document.createElement("th");
    th.textContent = headTitle;

    eventTableHeaderEl.appendChild(th);
  });

  // Process each event into a row in the table
  fetchedEvents.forEach((event) => {
    const tr = document.createElement("tr");

    // Create each row following the order of the header titles
    eventTableHeaderTitles.forEach((title) => {
      const td = document.createElement("td");

      td.innerText = event[title];
      tr.appendChild(td);
    });

    eventTableBodyEl.appendChild(tr);
  });

  // Append both the table header and body to the table itself
  eventTableEl.id = "events-display-area-table";
  eventTableEl.appendChild(eventTableHeaderEl);
  eventTableEl.appendChild(eventTableBodyEl);

  // Finally append our in-memory elements to the DOM
  // (replace existing table so we don't get a huge list of appended tables)
  const existingDisplayTableEl = eventDisplayAreaEl.querySelector("table");
  if (
    typeof existingDisplayTableEl === "undefined" ||
    existingDisplayTableEl === null
  ) {
    eventDisplayAreaEl.appendChild(eventTableEl);
  } else {
    existingDisplayTableEl.replaceWith(eventTableEl);
  }

  stateProxy.isLoading = false;
}

/**
 * Fetches the relevant JSON data based on the build run ID and machine ID
 * @param {number|string} runId
 * @param {number|string} machineId
 * @returns {Object}
 */
async function fetchBuildRunDataById(runId, machineId) {
  const response = await fetch(
    `https://www.midnightbsd.org/magus/async/machine-events?machine=${machineId}&run=${runId}`
  );
  stateProxy.isLoading = true;

  if (!response.ok) {
    stateProxy.hasError = true;
    const message = `Network Error: ${response.statusText}`;
    throw new Error(message);
  }

  const data = await response.json();
  return data;
}

/**
 * Fetches and generates HTML after selecting a build run
 * @param {number|string} event
 * @returns {void}
 */
const handleRunSelect = (event) => {
  const selectEl = event.target;
  const parentRowEl = selectEl.closest("tr");
  const machineIdCol = parentRowEl.querySelector("[data-machine-id]");
  const currentMachineId = machineIdCol.dataset.machineId;
  const selectedRunId = selectEl.value;
  const fetchedEvents = fetchBuildRunDataById(selectedRunId, currentMachineId);

  serializeEvents(fetchedEvents);
};

/**
 * Listen to any 'change' events on our select menu
 */
eventDisplaySelectEl.addEventListener("change", handleRunSelect);

function confirm_reset() {
  return confirm('Are you sure?')
}

