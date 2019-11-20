import React from 'react';
import logo from './logo.svg';
import './App.css';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom'
import OtherPage from './Otherpage'
import Fib from './Fib'

function App() {
  return (
    <Router>
      <header className="App-header">
        <h1 className="App-title">
          Fib Calc
        </h1>
      </header>
      <div className="App">
        <Link to="/">HOME</Link>
        <Link to="/otherpage">other page</Link>        
        <div>
          <Route exact path="/" component={Fib}/>
          <Route path="/otherpage" component={OtherPage}/>
        </div>
      </div>
    </Router>
  );
}

export default App;
