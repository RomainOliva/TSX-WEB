<br />

<h2>Le Tribunal: {{data.name}} <span ng-class="connected?'text-success':'text-danger'" class="text-danger"><i class="fa fa-gamepad"></i></span></h2>
<div class="row">
  <ul class="col-md-offset-1 col-md-4">
    <li>Argent: {{data.cash | number }}$</li>
    <li>Job: {{data.job_name}}, Groupe: {{data.group_name}}</li>
    <li>Temps de jeu:<ul>
      <li>Ce mois: {{playtime.month.play | duration}}</li>
      <li>Ces 31 derniers jours: {{playtime['31days'].play | duration}}</li>
      <li>Depuis le  {{playtime.start | date: 'd MMM yyyy'}}: {{playtime.begin.play | duration}}</li>
    </ul></li>
    <li>Ratio: <ul>
      <li ng-class="ratio.month.kill/ratio.month.death>1?'text-warning':'text-sucess'">Ce mois: {{ratio.month.kill}} tués / {{ratio.month.death}} morts = {{Math.round(ratio.month.kill/ratio.month.death*100)/100}} </li>
      <li ng-class="ratio['31days'].kill/ratio['31days'].death>1?'text-warning':'text-success'">Ces 31 derniers jours: {{ratio["31days"].kill}} tués / {{ratio["31days"].death}} morts = {{Math.round(ratio["31days"].kill/ratio["31days"].death*100)/100}}</li>
      <li ng-class="ratio.begin.kill/ratio.begin.death>1?'text-warning':'text-success'">Depuis le  {{playtime.start | date: 'd MMM yyyy'}}: {{ratio.begin.kill}} tués / {{ratio.begin.death}} morts = {{Math.round(ratio.begin.kill/ratio.begin.death*100)/100}}</li>
    </ul></li>
  </ul>
  <ul class="col-md-7" ng-show="moreinfo.id">

    <li>Ce joueur s'est fait report {{moreinfo.timestamp*1000 | date : "le d/M à HH:mm"}}</li>
    <li>{{moreinfo.report_raison}}: {{moreinfo.report_moreinfo}}</li>
    <br />
    <div class="text-center" ng-hide="disableButton">
      <button class="btn btn-danger" rest="put@/tribunal/{{moreinfo.id}}/1">Condamner</button>
      <button class="btn btn-warning" rest="put@/tribunal/{{moreinfo.id}}/0">Ignorer</button>
      <button class="btn btn-success" rest="put@/tribunal/{{moreinfo.id}}/2">Acquitter</button>
    </div>
    <div class="alert alert-danger" role="alert" ng-show="disableButton">
      <i class="fa fa-exclamation-triangle"></i>
      <b>Attention, pas de précipitation dans l'étude du cas de {{data.name}}.</b> Réfléchissez avant de confirmer votre vote, les boutons seront débloqués dans quelques instants.
    </div>
  </ul>
</div>
<ul class="nav nav-tabs" role="tablist" id="myTabs">
  <li ng-repeat="(key, val) in cat" ng-class="Search.TABS==key?'active':''"><a href="#/tribunal/case/{{case}}?TABS={{key}}">{{val}}</a></li>
</ul>
<div class="tab-content col-md-12">
  <div role="tabpanel" class="tab-pane row" ng-repeat="(key, val) in cat" id="{{key}}" ng-class="!Search.TABS&&key=='chat'?'active':''">
    <center ng-hide="tribunal[key]"><i ng-repeat="i in [5,4,3,2,1]" class="fa fa-cog fa-spin fa-{{i}}x"></i></center>
    <ul class="list-unstyled">
      <li ng-repeat="i in tribunal[key] track by $index"><div data-ng-bind-html="i | parselog:case"></div></li></ul>
  </div>
</div>
