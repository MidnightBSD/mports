PORTNAME=	mecab
PORTVERSION=	0.996
PORTREVISION=	4
CATEGORIES=	japanese textproc
MASTER_SITES=	https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE&dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet Another Part-of-Speech and Morphological Analyzer
WWW=		https://code.google.com/p/mecab/

LICENSE=	bsd3 gpl2 lgpl2.1
LICENSE_COMB=	multi

USES=		gettext-tools iconv libtool localbase perl5
USE_CXXSTD=	c++14
USE_LDCONFIG=	yes
USE_PERL5=	build

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	ac_cv_lib_stdcpp_main=no

INSTALL_TARGET=	install-strip

PORTDOCS=	AUTHORS README *.html

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} '/^libmecab_la_LIBADD =/s/$$/ $$(LTLIBICONV)/' \
		${WRKSRC}/src/Makefile.in
	@${REINPLACE_CMD} \
		-e '/CFLAGS/s|-O3|${CFLAGS}|' \
		-e '/CXXFLAGS/s|-O3|${CXXFLAGS}|' \
		${WRKSRC}/configure

post-install:
	${MV} ${PREFIX}/etc/mecabrc \
		${PREFIX}/etc/mecabrc.sample

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:N*.html:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
