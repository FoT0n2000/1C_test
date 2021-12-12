
Функция getItems(Запрос)       

	Ответ = Новый HTTPСервисОтвет(200);           
		
	ЗаписьJSON = новый ЗаписьJSON;  
	ПараметрыЗаписиJSON = новый ПараметрыЗаписиJSON(, Символы.Таб);	
	ЗаписьJSON.УстановитьСтроку(ПараметрыЗаписиJSON);
	
	Сериализатор = СериализаторXDTO;
	
	МассивНоменклатуры = новый Массив;
	
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Номенклатура.Ссылка КАК Ссылка
		|ИЗ
		|	Справочник.Номенклатура КАК Номенклатура";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		
		МассивНоменклатуры.Добавить(ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект());
		
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
	Сериализатор.ЗаписатьJSON(ЗаписьJSON, МассивНоменклатуры, НазначениеТипаXML.Явное); 
		
	Ответ.УстановитьТелоИзСтроки(ЗаписьJSON.Закрыть());
	
	Возврат Ответ;   
	
КонецФункции
