PORTNAME=	bsfilter
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.20
CATEGORIES=	mail ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bayesian spam filter written in Ruby
WWW=		https://github.com/nbkenichi/bsfilter

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-gdbm>=2.0.0,2:databases/rubygem-gdbm \
		rubygem-sdbm>=1.0.0:databases/rubygem-sdbm

USES=		ruby shebangfix
SHEBANG_FILES=	src/bsfilter.rb

USE_GITHUB=	yes
GH_ACCOUNT=	nbkenichi

NO_BUILD=	yes

OPTIONS_DEFINE=	EXAMPLES

# mports: PREFIX/EXAMPLESDIR already include FAKE_DESTDIR in do-install.
do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/bsfilter.rb ${PREFIX}/bin/${PORTNAME}
	@${MKDIR} ${EXAMPLESDIR}
.for FILE in bsfilter.conf.sample dot-qmail.sample
	${INSTALL_DATA} ${FILESDIR}/${FILE} ${EXAMPLESDIR}
.endfor
.for DIR in mda mua
	cd ${WRKSRC} && ${COPYTREE_SHARE} ${DIR} ${EXAMPLESDIR}
.endfor

.include <bsd.port.pre.mk>

.if ${RUBY_VER} >= 3.4
RUN_DEPENDS+=	rubygem-getoptlong>=0:devel/rubygem-getoptlong \
		rubygem-nkf>=0:net/rubygem-nkf
.endif

.include <bsd.port.post.mk>
