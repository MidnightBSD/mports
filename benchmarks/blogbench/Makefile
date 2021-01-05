# $MidnightBSD$

PORTNAME=	blogbench
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	benchmarks
MASTER_SITES=	http://download.pureftpd.org/pub/blogbench/ \
		ftp://ftp.pureftpd.org/pub/pure-ftpd/misc/blogbench/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance Test of Filesystem I/O

LICENSE=        bsd4

GNU_CONFIGURE=	yes
USES=		tar:bzip2

PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -Ee 's|[[:<:]]rand\(|arc4random(|g' \
		"${WRKSRC}"/src/*.[ch]

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}

.include <bsd.port.mk>
