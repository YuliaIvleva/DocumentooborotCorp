﻿
&НаСервере
Процедура ЗарегистрироватьВсеПодразделенияНаСервере()
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Подразделения.Ссылка КАК Ссылка
		|ИЗ
		|	Справочник.Подразделения КАК Подразделения";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Выборка = ПланыОбмена.Риб.Выбрать();
		Пока Выборка.Следующий() Цикл
			
			Если Выборка.Ссылка = ПланыОбмена.Риб.ЭтотУзел()  Тогда
				Продолжить;
			КонецЕсли;
			
			Если Выборка.Подразделение = ВыборкаДетальныеЗаписи.Ссылка Тогда
				ПланыОбмена.ЗарегистрироватьИзменения(Выборка.Ссылка, ВыборкаДетальныеЗаписи.Ссылка);
			КонецЕсли;
			
		КонецЦикла;	

	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Процедура ЗарегистрироватьВсеПодразделения(Команда)
	ЗарегистрироватьВсеПодразделенияНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьЗарегистрированныеИзменения(Команда)
	ОткрытьФорму("Справочник.Подразделения.Форма.ФормаСпискаИзменения");
КонецПроцедуры

&НаКлиенте
Процедура ОтменитьРегистрациюВсехПодразделений(Команда)
	ОтменитьРегистрациюВсехПодразделенийНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОтменитьРегистрациюВсехПодразделенийНаСервере()
	Выборка = ПланыОбмена.Риб.Выбрать();
	Пока Выборка.Следующий() Цикл
		Если Выборка.Ссылка = ПланыОбмена.Риб.ЭтотУзел()  Тогда
				Продолжить;
		КонецЕсли;
		ПланыОбмена.УдалитьРегистрациюИзменений(Выборка.Ссылка);
	КонецЦикла;
КонецПроцедуры
