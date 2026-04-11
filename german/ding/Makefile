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
	${PERL5} -pi.orig -e '$${sz}="\x{009F}"; s/Ã$${sz}/ss/g' \
	  ${WRKSRC}/${SWISSDICT}

do-install:
	@${MKDIR} ${PREFIX}/share/ding
	${INSTALL_SCRIPT} ${WRKSRC}/dingX ${PREFIX}/bin/ding
	${INSTALL_DATA} ${WRKSRC}/${DICTFILE} ${PREFIX}/share/ding/de-en.txt
	${INSTALL_DATA} ${WRKSRC}/${SWISSDICT} ${PREFIX}/share/ding
	${INSTALL_DATA} ${WRKSRC}/ding.png ${PREFIX}/share/ding/ding.png
	${INSTALL_DATA} ${WRKSRC}/ding.desktop.sed ${PREFIX}/share/ding/ding.desktop
	${INSTALL_MAN} ${WRKSRC}/ding.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
