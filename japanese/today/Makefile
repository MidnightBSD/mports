PORTNAME=	today
PORTVERSION=	2.12
PORTREVISION=	2
CATEGORIES=	japanese games
MASTER_SITES=	http://ftp.vector.co.jp/29/42/476/
DISTNAME=	ja-${PORTNAME}-${PORTVERSION}
DISTFILES=	td${PORTVERSION:S/.//}s.lzh \
		td${PORTVERSION:S/.//}m.lzh

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tells you what day today is
WWW=		https://www.vector.co.jp/soft/dos/personal/se002657.html

EXTRACT_DEPENDS=nkf:japanese/nkf

NO_WRKSUBDIR=	yes
USES=		lha

MAKEFILE=	${FILESDIR}/Makefile

OPTIONS_DEFINE=	DOCS

post-extract:
	@(cd ${WRKSRC}; lha xiqf utility.lzh src/dayinfo.c )
	@${ECHO_MSG} "===>  Extracting tbl file for ${DISTNAME}"
	@(cd ${WRKSRC}; lha xqf tbl.lzh )
	@${ECHO_MSG} "===>  Converting Kanji code for ${DISTNAME}"
	@(cd ${WRKSRC}; \
	for i in *.c *.h *.doc *.cnf birthday.tbl event*.tbl flower.tbl \
		gengo.tbl hist??.tbl history.tbl holiday.tbl magazine.tbl \
		monthly.tbl schedule.tbl suffix.tbl week.tbl; \
	do \
		nkf -Se $$i | ${TR} -d '\015' > $$i.tmp ;\
		${MV} -f $$i.tmp $$i ; \
	done)

post-patch:
	@${REINPLACE_CMD} -e 's|%%DATADIR%%|${DATADIR}|g' ${WRKSRC}/*.cnf

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/today.doc ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
