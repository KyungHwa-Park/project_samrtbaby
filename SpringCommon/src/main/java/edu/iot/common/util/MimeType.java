package edu.iot.common.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;



public class MimeType {
	
	static Map<String, String> map =
			Collections.synchronizedMap(
						new HashMap<>());
	
	static {
		map.put("aac", "audio/aac"); // "AAC 오디오 파일
		map.put("abw", "application/x-abiword"); // "AbiWord 문서
		map.put("arc", "application/octet-stream"); // "아카이브 문서 (인코딩된 다중 파일)
		map.put("avi", "video/x-msvideo"); // "AVI: Audio Video Interleave
		map.put("azw", "application/vndamazonebook"); // "아마존 킨들 전자책 포맷
		map.put("bin", "application/octet-stream"); // "모든 종류의 이진 데이터
		map.put("bz", "application/x-bzip"); // "BZip 아카이브
		map.put("bz2", "application/x-bzip2"); // "BZip2 아카이브
		map.put("csh", "application/x-csh"); // "C-Shell 스크립트
		map.put("css", "text/css"); // "Cascading Style Sheets (CSS)
		map.put("csv", "text/csv"); // "Comma-separated values (CSV)
		map.put("doc", "application/msword"); // "Microsoft Word
		map.put("epub", "application/epub+zip"); // "Electronic publication (EPUB)
		map.put("gif", "image/gif"); // "Graphics Interchange Format (GIF)
		map.put("htm", "text/html"); // "HyperText Markup Language (HTML)
		map.put("html", "text/html");
		map.put("ico", "image/x-icon"); // "Icon 포맷
		map.put("ics", "text/calendar"); // "iCalendar 포맷
		map.put("jar", "application/java-archive"); // "Java 아카이브 (JAR)
		map.put("jpeg", "image/jpeg"); // "JPEG 이미지
		map.put("jpg", "image/jpeg");
		map.put("js", "application/js"); // "JavaScript (ECMAScript)
		map.put("json", "application/json"); // "JSON 포맷
		map.put("mid", "audio/midi"); // "Musical Instrument Digital Interface (MIDI)
		map.put("midi", "audio/midi"); //
		map.put("mpeg", "video/mpeg"); // "MPEG 비디오
		map.put("mpkg", "application/vndappleinstaller+xml"); // "Apple Installer Package
		map.put("odp", "application/vndoasisopendocumentpresentation"); // "OpenDocuemnt 프리젠테이션 문서
		map.put("ods", "application/vndoasisopendocumentspreadsheet"); // "OpenDocuemnt 스프레드시트 문서
		map.put("odt", "application/vndoasisopendocumenttext"); // "OpenDocument 텍스트 문서
		map.put("oga", "audio/ogg"); // "OGG 오디오
		map.put("ogv", "video/ogg"); // "OGG 비디오
		map.put("ogx", "application/ogg"); // "OGG
		map.put("pdf", "application/pdf"); // "Adobe Portable Document Format (PDF)
		map.put("ppt", "application/vndms-powerpoint"); // "Microsoft PowerPoint
		map.put("rar", "application/x-rar-compressed"); // "RAR 아카이브

		map.put("rtf", "application/rtf"); // "Rich Text Format (RTF)
		map.put("sh", "application/x-sh"); // "Bourne 쉘 스크립트
		map.put("svg", "image/svg+xml"); // "Scalable Vector Graphics (SVG)
		map.put("swf", "application/x-shockwave-flash"); // "Small web format (SWF) 혹은 Adobe Flash document
		map.put("tar", "application/x-tar"); // "Tape Archive (TAR)
		map.put("tif", "image/tiff"); // "Tagged Image File Format (TIFF)
		map.put("ttf", "application/x-font-ttf"); // "TrueType Font
		map.put("vsd", "application/vndvisio"); // "Microsft Visio
		map.put("wav", "audio/x-wav"); // "Waveform Audio Format
		map.put("weba", "audio/webm"); //
		map.put("webm", "video/webm"); // "WEBM 비디오
		map.put("webp", "image/webp"); // "WEBP 이미지
		map.put("woff", "application/x-font-woff"); // "Web Open Font Format (WOFF)
		map.put("xhtml", "application/xhtml+xml"); // "XHTML
		map.put("xls", "application/vndms-excel"); // "Microsoft Excel
		map.put("xml", "application/xml"); // "XML
		map.put("xul", "application/vndmozillaxul+xml"); // "XUL
		map.put("zip", "application/zip"); // "ZIP archive
		map.put("3gp", "video/3gpp"); // "3GPP 오디오/비디오 컨테이너
		map.put("3g2", "video/3gpp2"); // "3GPP2 오디오/비디오 컨테이너
		map.put("7z", "application/x-7z-compressed"); // "7-zip 아카이브

	}
	
	public static String getContentType(String type) {
		return map.get(type);
	}
	
}
