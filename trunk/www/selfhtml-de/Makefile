# $FreeBSD: ports/german/selfhtml/Makefile,v 1.6 2006/06/09 21:07:11 linimon Exp $
# $MidnightBSD$

PORTNAME=	selfhtml
PORTVERSION=	8.1.2
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	www german
MASTER_SITES=	http://aktuell.de.selfhtml.org/extras/ \
		http://ftp.join.uni-muenster.de/pub/documents/selfhtml/ \
		ftp://ftp.uni-ulm.de/mirrors/selfhtml/ \
		http://free.w3research.com/ \
		http://selfhtml.hegglin.net/ \
		http://www.meta-text.net/ \
		http://www.lichteinfall.de/ \
		http://www.mastko.de/ \
		http://www.a-mazing.de/downloads/ \
		http://download.iansview.com/mirror/selfhtml.org/ \
		ftp://ftp.rub.de/pub/selfhtml/
PKGNAMEPREFIX=	de-
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensive german HTML reference

LICENSE=	unknown

WRKSRC=		${WRKDIR}

USES=		zip
NO_BUILD=	yes

PORTDOCS=	\
		index.htm \
		css \
		dhtml \
		diverses \
		editorial \
		grafik \
		helferlein \
		html \
		inter \
		intro \
		javascript \
		layouts \
		navigation \
		perl \
		php \
		projekt \
		quellen \
		servercgi \
		src \
		xml

post-patch:
# \r\n -> \n on text files
	@${FIND} -E ${WRKSRC} \
		-iregex \
		".*\.(css|dhtml|diverses|editorial|grafik|helferlein|htm|inter|intro|javascript|layouts|navigation|perl|php|projekt|quellen|servercgi|src|xml|xls|dtd)$$" \
		-type f -print0 \
		| ${XARGS} -0 -n 5 -x \
			${REINPLACE_CMD} -E \
			-e 's|||'
# remove extraneous backup files
	@${FIND} ${WRKSRC} -type f -name "*.bak" -print0 \
		| ${XARGS} -0 -n 5 -x \
			${RM} -f

do-install:
	@${MKDIR} ${DOCSDIR}
# line taken from textproc/xerces-j maintained by hq@FreeBSD.org
# recursively create dirs and install docs
	@cd ${WRKSRC} && \
		${FIND} ${PORTDOCS} -type d -exec ${MKDIR} "${DOCSDIR}/{}" \; && \
		${FIND} ${PORTDOCS} -not -type d -exec ${INSTALL_DATA} "{}" "${DOCSDIR}/{}" \;

.include <bsd.port.mk>
