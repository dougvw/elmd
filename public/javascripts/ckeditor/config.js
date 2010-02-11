/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	//config.uiColor = '#EEE8E1';
	config.toolbar = 'MyToolbar';
		
	config.toolbar_MyToolbar =
	[
	    ['Cut','Copy','Paste','PasteText','PasteFromWord'],
	    ['Undo','Redo','-','SelectAll','RemoveFormat'],
	    ['Bold','Italic','Underline','Strike'],
	    ['NumberedList','BulletedList','-','Outdent','Indent'],
	    ['Link','Unlink'],
	    ['About']
	];
	enterMode : CKEDITOR.ENTER_BR;

};

// 
// CKConfig.EnterMode = 'br' ; // p | div | br
// CKConfig.ShiftEnterMode = 'p' ; // p | div | br