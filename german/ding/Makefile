PORTNAME=	ding
PORTVERSION=	1.9
PORTREVISION=	1
CATEGORIES=	german tk
MASTER_SITES=	ftp://ftp.tu-chemnitz.de/pub/Local/urz/ding/ \
		FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	German-English dictionary program for X windows/Unix
WWW=		https://www-user.tu-chemnitz.de/~fri/ding/

LICENSE=	gpl2

RUN_DEPENDS=	wish8.6:x11-toolkits/tk86 \
		agrep:textproc/agrep

USES=		perl5

DICTFILE=	de-en.txt
SWISSDICT=	de_ch-en.txt

do-build:
	${SED} -E -e '1,/^exec/ s!wish!wish8.6!' \
	  -e 's!/usr/share/dict/de-en.txt!${PREFIX}/share/ding/de-en.txt!' \
	  ${WRKSRC}/ding > ${WRKSRC}/dingX
	${SED} -E -e 's!/usr/share/bin/!${PREFIX}/bin/!' \
	  ${WRKSRC}/ding.desktop > ${WRKSRC}/ding.desktop.sed
	@${CP} ${WRKSRC}/${DICTFILE} ${WRKSRC}/${SWISSDICT}
	${PERL5} -pi.orig -e '$${sz}="\x{009F}"; s/�$${sz}/ss/g' \
	  ${WRKSRC}/${SWISSDICT}

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/ding
	${INSTALL_SCRIPT} ${WRKSRC}/dingX ${STAGEDIR}${PREFIX}/bin/ding
	${INSTALL_DATA} ${WRKSRC}/${DICTFILE} ${STAGEDIR}${PREFIX}/share/ding/de-en.txt
	${INSTALL_DATA} ${WRKSRC}/${SWISSDICT} ${STAGEDIR}${PREFIX}/share/ding
	${INSTALL_DATA} ${WRKSRC}/ding.png ${STAGEDIR}${PREFIX}/share/ding/ding.png
	${INSTALL_DATA} ${WRKSRC}/ding.desktop.sed ${STAGEDIR}${PREFIX}/share/ding/ding.desktop
	${INSTALL_MAN} ${WRKSRC}/ding.1 ${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
