PORTNAME=	dash
PORTVERSION=	0.5.12
CATEGORIES=	shells
MASTER_SITES=	http://gondor.apana.org.au/~herbert/dash/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POSIX-compliant implementation of /bin/sh
WWW=		http://gondor.apana.org.au/~herbert/dash/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
# SIGRTMAX is larger than NSIG*2 which mksignames.c does not support.  Just
# disable RT signal handling.
CFLAGS+=	-DUNUSABLE_RT_SIGNALS

USES=		cpe gmake

PLIST_FILES=	bin/dash \
		share/man/man1/dash.1.gz
PORTDOCS=	ChangeLog

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} -e '/COMMON_CFLAGS =/ s|$$| ${CFLAGS}|' \
		${WRKSRC}/src/Makefile.in

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
