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
  <p>
  {s(`Benjamin C. Pierce`)}
  {s(` (University of Pennsylvania), Unison project leader, says:`)}
  {s(` "I think Unison is a very clear success for OCaml – in particular, for the extreme portability 
  and overall excellent engineering of the compiler and runtime system. OCaml's strong static typing, 
  in combination with its powerful module system, helped us organize a large and intricate codebase 
  with a high degree of encapsulation. This has allowed us to maintain a high level of robustness 
  through years of work by many different programmers. In fact, Unison may be unique among large OCaml 
  projects in having been `)}
  {s(`translated`)}
  {s(` from Java to OCaml midway through its development. Moving to OCaml was like a breath of fresh air."`)}
  </p>
  <h2>{s(`The MLdonkey peer-to-peer client`)}</h2>
  <p>
  {s(`MLdonkey`)}
  {s(` is a multi-platform multi-networks peer-to-peer client. It was the first open-source client to access 
  the eDonkey network. Today, MLdonkey supports several other large networks, among which Overnet, Bittorrent, 
  Gnutella, Gnutella2, Fasttrack, Soulseek, Direct-Connect, and Opennap. Searches can be conducted over several 
  networks concurrently; files are downloaded from and uploaded to multiple peers concurrently.`)}
  </p>
  <p>
  {s(`An MLdonkey developer says:`)}
  {s(` "Early in 2002, we decided to use OCaml to program a network application in the emerging world of peer-to-peer 
  systems. The result of our work, MLdonkey, has surpassed our hopes: MLdonkey is currently the most popular 
  peer-to-peer file-sharing client according to `)}
  {s(`free(code)`)}
  {s(` (formerly "freshmeat.net"), with about 10,000 daily users. Moreover, MLdonkey is the only client able 
  to connect to several peer-to-peer networks, to download and share files. It works as a daemon, running 
  unattended on the computer, and can be controlled remotely using a choice of three different kinds of 
  interfaces: GTK, web and telnet."`)}
  </p>
  <h2>{s(`LexiFi's Modeling Language for Finance`)}</h2>
  </>