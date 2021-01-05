// module LINK = Markdown.LINK

let s = React.string

let default = () =>
  <>
  <h1>{s(`Success Stories`)}</h1>
  <h2>{s(`Jane Street`)}</h2>
  <p>
  {s(`Jane Street is a proprietary trading firm that uses OCaml as its primary development platform. 
  Our operation runs at a large scale, generating billions of dollars of transactions every day from 
  our offices in Hong Kong, London and New York, with strategies that span many asset classes, 
  time-zones and regulatory regimes.`)}
  </p>
  <p>
  {s(`Jane Street has been contributing open-source libraries back to the wider community for many years, 
  including Core, our alternative standard library, Async, a cooperative concurrency library, and several 
  syntax extensions like binprot and sexplib. All of these can be found at `)}
  {s(`http://janestreet.github.io`)}
  {s(`. All in, we've open-sourced more than 200k lines of code.`)}
  </p>
  <h2>{s(`The Unison File Synchronizer`)}</h2>
  <p>
  {s(`Unison`)}
  {s(` is a popular file-synchronization tool for Windows and most flavors of Unix. It allows two 
  replicas of a collection of files and directories to be stored on different hosts (or different 
  disks on the same host), modified separately, and then brought up to date by propagating the changes 
  in each replica to the other. Unlike simple mirroring or backup utilities, Unison can deal with 
  updates to both replicas: updates that do not conflict are propagated automatically and conflicting 
  updates are detected and displayed. Unison is also resilient to failure: it is careful to leave 
  the replicas and its own private structures in a sensible state at all times, even in case of 
  abnormal termination or communication failures.`)}
  </p>
  </>