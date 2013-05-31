{include file='header' pageTitle='wcf.acp.menu.link.faker.user'}

<script type="text/javascript">
//<![CDATA[
	$(function() {
		WCF.TabMenu.init();
	});
//]]>
</script>

<header class="boxHeadline">
	<hgroup>
		<h1>{lang}wcf.acp.menu.link.faker.user{/lang}</h1>
	</hgroup>
</header>

<div class="tabMenuContainer">
	<nav class="tabMenu">
		<ul>
			<li><a href="{@$__wcf->getAnchor('user')}">{lang}wcf.acp.faker.user{/lang}</a></li>
			
			{event name='tabMenuTabs'}
		</ul>
	</nav>
	
	<div id="user" class="container containerPadding tabMenuContent">
		<script type="text/javascript">
		//<![CDATA[
			$(function() {
				$('#fakeUsers').click(function () {
					var $groupIDs = [];
					$('input[name="userGroupIDs[]"]:checked').each(function(index, element) {
						$groupIDs.push($(element).val());
					});
					
					new WCF.ACP.Worker('faker', 'wcf\\system\\worker\\FakerWorker', '{lang}wcf.acp.faker.faking.user{/lang}', {
						amount: $('#userAmount').val(),
						groupIDs: $groupIDs,
						faker: 'wcf\\system\\faker\\UserFaker',
						fakerLocale: $('#userFakerLocale').val(),
						proceedController: 'UserFaker',
						userGender: $('#userGender').val(),
						userRandomOldUsername: $('#userRandomOldUsername').is(':checked') ? 1 : 0,
						userRandomAboutMe: $('#userRandomAboutMe').is(':checked') ? 1 : 0,
						userRandomSignature: $('#userRandomSignature').is(':checked') ? 1 : 0,
						userRandomBirthday: $('#userRandomBirthday').is(':checked') ? 1 : 0,
						userRandomHomepage: $('#userRandomHomepage').is(':checked') ? 1 : 0,
						userRandomLocation: $('#userRandomLocation').is(':checked') ? 1 : 0
					});
				});
			});
		//]]>
		</script>
		
		<fieldset>
			<legend>{lang}wcf.global.form.data{/lang}</legend>
			
			<dl>
				<dt><label for="userFakerLocale">{lang}wcf.acp.faker.locale{/lang}</label></dt>
				<dd>
					{htmlOptions options=$availableLocales name='userFakerLocale' id='userFakerLocale'}
					<small>{lang}wcf.acp.faker.locale.description{/lang}</small>
				</dd>
			</dl>
			
			<dl>
				<dt><label for="userAmount">{lang}wcf.acp.faker.amount{/lang}</label></dt>
				<dd><input type="number" id="userAmount" name="userAmount" class="small" min="1" value="10" /></dd>
			</dl>
			
			<dl>
				<dt><label for="userGroupIDs">{lang}wcf.acp.faker.user.userGroups{/lang}</label></dt>
				<dd>
					{htmlCheckboxes options=$userGroups name='userGroupIDs' id='userGroupIDs'}
					<small>{lang}wcf.acp.faker.user.userGroups.description{/lang}</small>
				</dd>
			</dl>
		</fieldset>
		
		<fieldset>
			<legend>{lang}wcf.user.option.category.profile{/lang}</legend>
			
			<dl>
				<dd><label><input type="checkbox" id="userRandomOldUsername" /> {lang}wcf.acp.faker.user.oldUsername{/lang}</label></dd>
			</dl>
			
			<dl>
				<dt><label for="userGender">{lang}wcf.user.option.gender{/lang}</label></dt>
				<dd>
					<select name="userGender" id="userGender">
						<option value="0">{lang}wcf.global.noDeclaration{/lang}</option>
						<option value="-1">{lang}wcf.acp.faker.random{/lang}</option>
						<option value="1">{lang}wcf.user.gender.male{/lang}</option>
						<option value="2">{lang}wcf.user.gender.female{/lang}</option>
					</select>
				</dd>
			</dl>
			
			<dl>
				<dd><label><input type="checkbox" id="userRandomAboutMe" /> {lang}wcf.acp.faker.user.aboutMe{/lang}</label></dd>
			</dl>
			
			<dl>
				<dd><label><input type="checkbox" id="userRandomSignature" /> {lang}wcf.acp.faker.user.signature{/lang}</label></dd>
			</dl>
			
			<dl>
				<dd><label><input type="checkbox" id="userRandomBirthday" /> {lang}wcf.acp.faker.user.birthday{/lang}</label></dd>
			</dl>
			
			<dl>
				<dd><label><input type="checkbox" id="userRandomLocation" /> {lang}wcf.acp.faker.user.location{/lang}</label></dd>
			</dl>
			
			<dl>
				<dd><label><input type="checkbox" id="userRandomHomepage" /> {lang}wcf.acp.faker.user.homepage{/lang}</label></dd>
			</dl>
		</fieldset>
		
		<div class="formSubmit">
			<button id="fakeUsers" class="buttonPrimary" accesskey="s">{lang}wcf.acp.faker.button.user{/lang}</button>
		</div>
	</div>
	
	{event name='tabMenuContent'}
</div>

{include file='footer'}