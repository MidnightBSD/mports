# Created by: Autrijus Tang <autrijus@autrijus.org>

PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl bindings for Version control system

USES=		perl5 sqlite:3
USE_PERL5=	build run

PORTREVISION_113=	0
PORTREVISION_LTS=	0

SVN_BUILD_BINDINGS=	yes

MAKE_JOBS_UNSAFE=	yes

.include "${.CURDIR}/../../devel/subversion/Makefile.addons"

CATEGORIES+=	perl5

# requires sqlite3 from ports
BUILD_DEPENDS+=	${LOCALBASE}/bin/sqlite3:databases/sqlite3
RUN_DEPENDS+=	${LOCALBASE}/bin/sqlite3:databases/sqlite3

CONFIGURE_ARGS+=	--without-gnome-keyring \
			--without-kwallet \
			--with-apxs=no \
			-with-sqlite=/usr/local

ALL_TARGET=	swig-pl-lib swig-pl
INSTALL_TARGET=	install-swig-pl

pre-install:
	${REINPLACE_CMD} '/SWIG_PL_DIR/s, install$$, all pure_install,g' ${WRKSRC}/Makefile

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/SVN/_Client/_Client.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/SVN/_Core/_Core.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/SVN/_Delta/_Delta.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/SVN/_Fs/_Fs.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/SVN/_Ra/_Ra.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/SVN/_Repos/_Repos.so
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/SVN/_Wc/_Wc.so

.include <bsd.port.post.mk>
