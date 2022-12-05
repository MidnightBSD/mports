PORTNAME=	zpaqfranz
DISTVERSION=	55.12
CATEGORIES=	archivers
MASTER_SITES=	http://www.francocorbelli.it/zpaqfranz/freebsd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Swiss army knife for the serious backup manager
WWW=		https://github.com/fcorbelli/zpaqfranz

LICENSE=	bsd2 mit	
LICENSE_COMB=	dual

NO_WRKSUBDIR=	yes

OPTIONS_DEFINE=		DIRCOMMAND
DIRCOMMAND_DESC=	Add a symlink to call the dir subcommand directly

PLIST_FILES=	bin/zpaqfranz

DIRCOMMAND_PLIST_FILES=		bin/dir
DIRCOMMAND_CONFLICTS_INSTALL=	gnuls

post-install-DIRCOMMAND-off:
		${RM} ${FAKE_DESTDIR}${LOCALBASE}/bin/dir

.include <bsd.port.pre.mk>

.if ${ARCH} != "amd64"
CFLAGS+=	-DNOJIT
.endif

.include <bsd.port.post.mk>
