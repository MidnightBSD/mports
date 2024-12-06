PORTNAME=	cryptofs
PORTVERSION=	0.6.0
CATEGORIES=	filesystems
MASTER_SITES=	https://BSDforge.com/projects/source/sysutils/fusefs-cryptofs/
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Encrypted filesystem for FUSE
WWW=		https://BSDforge.com/projects/sysutils/fusefs-cryptofs/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgcrypt.so:security/libgcrypt

GNU_CONFIGURE=	yes
USES=		fuse gnome pkgconfig
USE_GNOME=	glib20
DOCS=		README cryptofs.conf

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
